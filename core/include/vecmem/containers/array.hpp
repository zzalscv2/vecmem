/** VecMem project, part of the ACTS project (R&D line)
 *
 * (c) 2021 CERN for the benefit of the ACTS project
 *
 * Mozilla Public License Version 2.0
 */
#pragma once

// Local include(s).
#include "vecmem/memory/resources/memory_resource.hpp"

// System include(s).
#include <cstddef>
#include <iterator>
#include <memory>

namespace vecmem {

   namespace details {
      /// Invalid size parameter for @c vecmem::array
      static constexpr std::size_t array_invalid_size =
         static_cast< std::size_t >( -1 );
   } // namespace details

   /// Array with a fixed size, chosen during runtime
   ///
   /// This class is similar to @c std::array in its interface, but fulfils a
   /// slightly different role. It wraps a fixed sized array just like
   /// @c std::array does, but it uses @c vecmem::memory_resource to manage that
   /// fixed sized array. As such, the size of the array can be decided at
   /// runtime, it does not need to be decided at compile time.
   ///
   /// However, to be able to use it as a drop-in replacement for @c std::array,
   /// it does provide an optional second template argument, which can be used
   /// to set the fixed size of the array at compile time.
   ///
   template< typename T, std::size_t N = details::array_invalid_size >
   class array {

   public:
      /// @name Type definitions, mimicking @c std::array
      /// @{

      /// Type of the array elements
      typedef T                  value_type;
      /// Size type for the array
      typedef std::size_t        size_type;
      /// Pointer difference type
      typedef std::ptrdiff_t     difference_type;

      /// Value reference type
      typedef value_type&        reference_type;
      /// Constant value reference type
      typedef const value_type&  const_reference_type;

      /// Value pointer type
      typedef value_type*        pointer_type;
      /// Constant value pointer type
      typedef const value_type*  const_pointer_type;

      /// Forward iterator type
      typedef pointer_type       iterator;
      /// Constant forward iterator type
      typedef const_pointer_type const_iterator;

      /// Reverse iterator type
      typedef std::reverse_iterator< iterator > reverse_iterator;
      /// Constant reverse iterator type
      typedef std::reverse_iterator< const_iterator > const_reverse_iterator;

      /// @}

      /// Struct used for deleting the allocated memory block
      class deleter {

      public:
         /// Constructor
         deleter( std::size_t bytes, memory_resource& resource );

         /// Copy constructor
         deleter( const deleter& ) = default;
         /// Move constructor
         deleter( deleter&& ) = default;
         /// Copy assignment operator
         deleter& operator=( const deleter& ) = default;
         /// Move assignment operator
         deleter& operator=( deleter&& ) = default;

         /// Operator performing the deletion of the object.
         void operator()( void* ptr );

      private:
         /// The number of bytes allocated for the memory block
         std::size_t m_bytes;
         /// The memory resource used for deleting the memory block
         memory_resource* m_resource;

      }; // struct deleter

      /// Constructor with a memory resource to use
      ///
      /// Can only be used if the user chose a non-default value for the size
      /// template parameter.
      ///
      array( memory_resource& resource );

      /// Constructor with a size and a memory resource to use
      ///
      /// Can only be used if the user uses the default (invalid) value for the
      /// size template parameter.
      ///
      array( memory_resource& resource, size_type size );

      /// Destructor
      ~array() = default;

      /// @name Element accessor functions/operators
      /// @{

      /// Access one element of the array (non-const)
      reference_type at( size_type pos );
      /// Access one element of the array (const)
      const_reference_type at( size_type pos ) const;

      /// Access one element in the array (non-const)
      reference_type operator[]( size_type pos );
      /// Access one element in the array (const)
      const_reference_type operator[]( size_type pos ) const;

      /// Access the first element in the array (non-const)
      reference_type front();
      /// Access the first element in the array (const)
      const_reference_type front() const;

      /// Access the last element of the array (non-const)
      reference_type back();
      /// Access the last element of the array (const)
      const_reference_type back() const;

      /// Access a pointer to the underlying memory block (non-const)
      pointer_type data();
      /// Access a pointer to the underlying memory block (const)
      const_pointer_type data() const;

      /// @}

      /// @name Iterator functions
      /// @{

      /// Get an iterator to the first element of the array (non-const)
      iterator begin();
      /// Get an iterator to the first element of the array (const)
      const_iterator begin() const;
      /// Get an iterator to the first element of the array (const)
      const_iterator cbegin() const;

      /// Get an iterator to the element following the last element of the array
      /// (non-const)
      iterator end();
      /// Get an iterator to the element following the last element of the array
      /// (const)
      const_iterator end() const;
      /// Get an iterator to the element following the last element of the array
      /// (const)
      const_iterator cend() const;

      /// Get a reverse iterator to the last element of the array (non-const)
      reverse_iterator rbegin();
      /// Get a reverse iterator to the last element of the array (const)
      const_reverse_iterator rbegin() const;
      /// Get a reverse iterator to the last element of the array (const)
      const_reverse_iterator crbegin() const;

      /// Get a reverse iterator to the element preceeding the first element of
      /// the array (non-const)
      reverse_iterator rend();
      /// Get a reverse iterator to the element preceeding the first element of
      /// the array (const)
      const_reverse_iterator rend() const;
      /// Get a reverse iterator to the element preceeding the first element of
      /// the array (const)
      const_reverse_iterator crend() const;

      /// @}

      /// @name Capacity ckecker functions
      /// @{

      /// Check whether the array has no elements
      bool empty() const noexcept;
      /// Get the number of elements in the array
      size_type size() const noexcept;

      /// @}

      /// @name Content manipulation functions
      /// @{

      /// Assign the specified value to all elements of the array
      void fill( const_reference_type value );

      /// @}

   private:
      /// The size of the allocated array
      size_type m_size;
      /// The allocated array
      std::unique_ptr< value_type, deleter > m_memory;

   }; // class array

} // namespace vecmem

// Include the implementation.
#include "vecmem/containers/array.ipp"